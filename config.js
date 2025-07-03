// Configuration file for EralpAhmet Trading Website
const config = {
    // Email configuration
    email: {
        recipient: "8251108@gmail.com",
        subject: "Yeni Strateji Talebi"
    },
    
    // Available strategies
    strategies: [
        "PSAR Strategy",
        "ATR Strategy",
        "Özel Strateji Talebi"
    ],
    
    // Authentication configuration
    auth: {
        googleClientId: "YOUR_GOOGLE_CLIENT_ID.apps.googleusercontent.com",
        recaptchaSiteKey: "YOUR_RECAPTCHA_SITE_KEY"
    },
    
    // Admin configuration
    admin: {
        username: "admin",
        password: "admin"
    },
    
    // Test user configuration
    testUser: {
        username: "testuser",
        password: "testuser"
    }
};

// Export for use in other files
if (typeof module !== 'undefined' && module.exports) {
    module.exports = config;
} else {
    window.config = config;
} 