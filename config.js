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
    ]
};

// Export for use in other files
if (typeof module !== 'undefined' && module.exports) {
    module.exports = config;
} else {
    window.config = config;
} 