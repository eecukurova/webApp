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

    // Whop integration - Product purchase links
    // Replace with your actual Whop product URLs
    whop: {
        enabled: true,
        products: {
            "PSAR Strategy": {
                url: "https://whop.com/your-psar-strategy/",  // Replace with actual PSAR product URL
                price: "$49.99",
                currency: "USD"
            },
            "ATR Strategy": {
                url: "https://whop.com/your-atr-strategy/",   // Replace with actual ATR product URL
                price: "$79.99", 
                currency: "USD"
            }
        },
        // Fallback URL if specific product not found - replace with your main store URL
        fallbackUrl: "https://whop.com/your-store/"
    },
    
    // Authentication configuration
    auth: {
        googleClientId: "YOUR_GOOGLE_CLIENT_ID.apps.googleusercontent.com",
        recaptchaSiteKey: "YOUR_RECAPTCHA_SITE_KEY",
        enableRecaptcha: false // true = CAPTCHA açık, false = CAPTCHA kapalı
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