document.addEventListener('DOMContentLoaded', function() {
    // DOM Elements
    const chatbotContainer = document.getElementById('chatbot-container');
    const openChatbot = document.getElementById('open-chatbot');
    const closeChatbot = document.getElementById('close-chatbot');
    const minimizeChatbot = document.getElementById('minimize-chatbot');
    const chatMessages = document.getElementById('chat-messages');
    const userInput = document.getElementById('user-input');
    const sendBtn = document.getElementById('send-btn');
    const quickActionBtns = document.querySelectorAll('.quick-action-btn');
    const notificationBadge = document.getElementById('notification-badge');

    // State variables
    let isBotTyping = false;
    let unreadMessages = 0;
    let isMinimized = false;

    // Enhanced responses with rich content
    const responses = {
        "greeting": {
            text: "Hello! I'm your hospital assistant. How can I help you today?",
            buttons: [
                { text: "Book Appointment", query: "How to book an appointment?" },
                { text: "Find a Doctor", query: "List of doctors" },
                { text: "Emergency", query: "Emergency contacts" }
            ]
        },
        "appointment": {
            text: "You can book an appointment through these options:",
            html: `
                <ol class="list-decimal list-inside space-y-1">
                    <li><strong>Online:</strong> Visit our <a href="/appointments" class="text-blue-600 hover:underline">appointments page</a></li>
                    <li><strong>Phone:</strong> Call our reception at <span class="font-semibold">(123) 456-7890</span></li>
                    <li><strong>In-person:</strong> Visit our front desk during working hours</li>
                </ol>
                <p class="mt-2">Would you like me to direct you to the booking page?</p>
            `,
            buttons: [
                { text: "Yes, please", query: "Take me to booking page" },
                { text: "No, thanks", query: "That's all" }
            ]
        },
        "doctors": {
            text: "Here are some of our specialist doctors:",
            html: `
                <div class="space-y-2">
                    <div class="p-2 bg-blue-50 rounded-lg">
                        <p class="font-semibold">Dr. Sarah Johnson</p>
                        <p class="text-sm text-gray-600">Cardiology • 15 years experience</p>
                    </div>
                    <div class="p-2 bg-blue-50 rounded-lg">
                        <p class="font-semibold">Dr. Michael Chen</p>
                        <p class="text-sm text-gray-600">Neurology • 10 years experience</p>
                    </div>
                    <div class="p-2 bg-blue-50 rounded-lg">
                        <p class="font-semibold">Dr. Emily Wilson</p>
                        <p class="text-sm text-gray-600">Pediatrics • 8 years experience</p>
                    </div>
                </div>
                <p class="mt-2">You can view full profiles on our <a href="/doctors" class="text-blue-600 hover:underline">doctors page</a>.</p>
            `
        },
        "emergency": {
            text: "For emergencies:",
            html: `
                <div class="space-y-2">
                    <div class="p-2 bg-red-50 rounded-lg">
                        <p class="font-semibold text-red-700">Immediate Life-threatening Emergency</p>
                        <p class="text-sm">Call <span class="font-bold">911</span> or go to the nearest Emergency Room</p>
                    </div>
                    <div class="p-2 bg-yellow-50 rounded-lg">
                        <p class="font-semibold text-yellow-700">Urgent Medical Attention</p>
                        <p class="text-sm">Call our Emergency Department at <span class="font-bold">(123) 456-7891</span></p>
                    </div>
                </div>
                <p class="mt-2">Our Emergency Department is open 24/7 at 123 Medical Center Drive.</p>
            `
        },
        "hours": {
            text: "Our hospital hours are:",
            html: `
                <div class="space-y-1">
                    <div class="flex justify-between">
                        <span class="font-medium">Emergency Department:</span>
                        <span>24/7</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="font-medium">Outpatient Services:</span>
                        <span>8:00 AM - 8:00 PM</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="font-medium">Pharmacy:</span>
                        <span>9:00 AM - 7:00 PM</span>
                    </div>
                </div>
            `
        },
        "default": {
            text: "I'm sorry, I didn't understand that. I can help with:",
            buttons: [
                { text: "Appointments", query: "How to book an appointment?" },
                { text: "Doctor Info", query: "List of doctors" },
                { text: "Emergency", query: "Emergency contacts" },
                { text: "Visiting Hours", query: "Hospital hours" }
            ]
        }
    };

    // Initialize chatbot
    function initChatbot() {
        // Load any saved messages from localStorage
        loadChatHistory();
        
        // Set up event listeners
        setupEventListeners();
    }

    // Set up all event listeners
    function setupEventListeners() {
        // Toggle chatbot visibility
        openChatbot.addEventListener('click', () => {
            if (isMinimized) {
                maximizeChatbot();
            } else {
                openChatbotWindow();
            }
        });

        closeChatbot.addEventListener('click', () => {
            closeChatbotWindow();
        });

        minimizeChatbot.addEventListener('click', () => {
            minimizeChatbotWindow();
        });

        // Send message on button click or Enter key
        sendBtn.addEventListener('click', sendMessage);
        userInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                sendMessage();
            }
        });

        // Quick action buttons
        quickActionBtns.forEach(btn => {
            btn.addEventListener('click', (e) => {
                const query = e.currentTarget.getAttribute('data-query');
                userInput.value = query;
                sendMessage();
            });
        });

        // Track when the chat is visible to clear notifications
        chatbotContainer.addEventListener('click', () => {
            if (unreadMessages > 0) {
                unreadMessages = 0;
                updateNotificationBadge();
            }
        });
    }

    // Open chatbot window
    function openChatbotWindow() {
        chatbotContainer.classList.remove('hidden', 'chatbot-exit');
        chatbotContainer.classList.add('chatbot-enter');
        
        // Clear notifications when opening
        if (unreadMessages > 0) {
            unreadMessages = 0;
            updateNotificationBadge();
        }
    }

    // Close chatbot window
    function closeChatbotWindow() {
        chatbotContainer.classList.remove('chatbot-enter');
        chatbotContainer.classList.add('chatbot-exit');
        setTimeout(() => {
            chatbotContainer.classList.add('hidden');
        }, 300);
    }

    // Minimize chatbot window
    function minimizeChatbotWindow() {
        chatbotContainer.classList.remove('chatbot-enter');
        chatbotContainer.classList.add('chatbot-exit');
        setTimeout(() => {
            chatbotContainer.classList.add('hidden');
            isMinimized = true;
        }, 300);
    }

    // Maximize chatbot window
    function maximizeChatbotWindow() {
        isMinimized = false;
        chatbotContainer.classList.remove('hidden', 'chatbot-exit');
        chatbotContainer.classList.add('chatbot-enter');
    }

    // Send message function
    function sendMessage() {
        const message = userInput.value.trim();
        if (message) {
            addUserMessage(message);
            userInput.value = '';
            
            // Show typing indicator
            showTypingIndicator();
            
            // Simulate processing delay
            setTimeout(() => {
                hideTypingIndicator();
                const reply = generateReply(message.toLowerCase());
                addBotMessage(reply);
                
                // Save to chat history
                saveChatHistory();
            }, 1000 + Math.random() * 1500); // Random delay between 1-2.5 seconds
        }
    }

    // Add user message to chat
    function addUserMessage(message) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'flex justify-end message-enter';
        messageDiv.innerHTML = `
            <div class="bg-blue-600 text-white rounded-xl py-2 px-4 max-w-[80%] shadow-sm">
                ${message}
            </div>
        `;
        chatMessages.appendChild(messageDiv);
        scrollToBottom();
    }

    // Add bot message to chat
    function addBotMessage(response) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'flex justify-start message-enter';
        
        let contentHtml = '';
        if (response.html) {
            contentHtml = response.html;
        } else {
            contentHtml = `<p>${response.text}</p>`;
        }
        
        // Add buttons if available
        let buttonsHtml = '';
        if (response.buttons && response.buttons.length > 0) {
            buttonsHtml = `<div class="mt-3 flex flex-wrap gap-2">${
                response.buttons.map(btn => 
                    `<button class="action-btn bg-blue-50 hover:bg-blue-100 text-blue-800 text-sm px-3 py-1 rounded-full transition" 
                            data-query="${btn.query}">
                        ${btn.text}
                    </button>`
                ).join('')
            }</div>`;
        }
        
        messageDiv.innerHTML = `
            <div class="bg-white rounded-xl py-3 px-4 shadow-sm max-w-[80%] border border-gray-100">
                ${contentHtml}
                ${buttonsHtml}
            </div>
        `;
        
        chatMessages.appendChild(messageDiv);
        scrollToBottom();
        
        // Add event listeners to any action buttons
        messageDiv.querySelectorAll('.action-btn').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const query = e.currentTarget.getAttribute('data-query');
                userInput.value = query;
                sendMessage();
            });
        });
        
        // Update notification if chat is closed
        if (chatbotContainer.classList.contains('hidden')) {
            unreadMessages++;
            updateNotificationBadge();
        }
    }

    // Show typing indicator
    function showTypingIndicator() {
        if (isBotTyping) return;
        
        isBotTyping = true;
        const typingDiv = document.createElement('div');
        typingDiv.className = 'flex justify-start';
        typingDiv.innerHTML = `
            <div class="bg-white rounded-xl py-2 px-4 shadow-sm max-w-[80%] border border-gray-100">
                <div class="typing-indicator">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        `;
        chatMessages.appendChild(typingDiv);
        scrollToBottom();
    }

    // Hide typing indicator
    function hideTypingIndicator() {
        isBotTyping = false;
        const typingIndicators = document.querySelectorAll('.typing-indicator');
        typingIndicators.forEach(indicator => {
            indicator.parentElement.parentElement.remove();
        });
    }

    // Generate reply based on user input
    function generateReply(message) {
        if (message.includes('hello') || message.includes('hi') || message.includes('hey')) {
            return responses["greeting"];
        } else if (message.includes('appointment') || message.includes('book') || message.includes('schedule')) {
            return responses["appointment"];
        } else if (message.includes('doctor') || message.includes('physician') || message.includes('specialist')) {
            return responses["doctors"];
        } else if (message.includes('emergency') || message.includes('urgent') || message.includes('emergencies')) {
            return responses["emergency"];
        } else if (message.includes('hour') || message.includes('open') || message.includes('time') || message.includes('when')) {
            return responses["hours"];
        } else {
            return responses["default"];
        }
    }

    // Scroll to bottom of chat
    function scrollToBottom() {
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }

    // Update notification badge
    function updateNotificationBadge() {
        if (unreadMessages > 0) {
            notificationBadge.textContent = unreadMessages;
            notificationBadge.classList.remove('hidden');
        } else {
            notificationBadge.classList.add('hidden');
        }
    }

    // Save chat history to localStorage
    function saveChatHistory() {
        const messages = chatMessages.innerHTML;
        localStorage.setItem('hospitalChatbotHistory', messages);
    }

    // Load chat history from localStorage
    function loadChatHistory() {
        const savedMessages = localStorage.getItem('hospitalChatbotHistory');
        if (savedMessages) {
            chatMessages.innerHTML = savedMessages;
            
            // Reattach event listeners to any action buttons
            document.querySelectorAll('.action-btn').forEach(btn => {
                btn.addEventListener('click', (e) => {
                    const query = e.currentTarget.getAttribute('data-query');
                    userInput.value = query;
                    sendMessage();
                });
            });
            
            scrollToBottom();
        }
    }

    // Initialize the chatbot
    initChatbot();
});