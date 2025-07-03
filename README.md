# EralpAhmet Trading Website

TradingView stratejileri satışı için profesyonel website.

## 🔐 Authentication Setup

Website'de Google OAuth ve reCAPTCHA kullanılmaktadır. Bu sistemi aktif hale getirmek için aşağıdaki API anahtarlarını almanız gerekir:

### 1. Google OAuth Setup

1. [Google Cloud Console](https://console.cloud.google.com/)'a gidin
2. Yeni bir proje oluşturun veya mevcut projeyi seçin
3. **API & Services > Credentials** bölümüne gidin
4. **Create Credentials > OAuth 2.0 Client ID** seçin
5. Application type olarak **Web application** seçin
6. **Authorized JavaScript origins** ekleyin:
   - `http://localhost:3000` (development için)
   - `https://yourdomain.com` (production için)
7. Client ID'yi kopyalayın

### 2. reCAPTCHA Setup

1. [Google reCAPTCHA](https://www.google.com/recaptcha/admin) sitesine gidin
2. **Admin Console**'a gidin
3. **Create** butonuna tıklayın
4. **reCAPTCHA v2** seçin
5. Domain'inizi ekleyin:
   - `localhost` (development için)
   - `yourdomain.com` (production için)
6. Site key'i kopyalayın

### 3. Config Dosyasını Güncelleyin

`config.js` dosyasındaki placeholder değerleri gerçek API anahtarlarıyla değiştirin:

```javascript
auth: {
    googleClientId: "YOUR_ACTUAL_GOOGLE_CLIENT_ID.apps.googleusercontent.com",
    recaptchaSiteKey: "YOUR_ACTUAL_RECAPTCHA_SITE_KEY"
}
```

## 📧 Email Configuration

Email ayarları `config.js` dosyasında yapılandırılabilir:

```javascript
email: {
    recipient: "8251108@gmail.com",
    subject: "Yeni Strateji Talebi"
}
```

## 🚀 Özellikler

### Authentication
- ✅ Google OAuth ile giriş
- ✅ Email/şifre ile giriş
- ✅ reCAPTCHA güvenliği
- ✅ Oturum yönetimi (localStorage)
- ✅ Otomatik giriş kalma

### Protected Content
- ✅ Sadece giriş yapanlar strateji talebi yapabilir
- ✅ Premium üye avantajları bölümü
- ✅ Kullanıcı dostu mesajlar

### User Experience
- ✅ Modal tabanlı giriş ekranı
- ✅ Başarı/hata mesajları
- ✅ Responsive tasarım
- ✅ Türkçe dil desteği

## 📱 Kullanım

1. **Giriş Yapmadan**: Genel içerikler görülebilir
2. **Giriş Yaptıktan Sonra**: 
   - Strateji talebi formu erişilebilir
   - Premium avantajlar bölümü görünür
   - Kullanıcı adı header'da gösterilir

## 🔧 Deployment

1. API anahtarlarını config.js'e ekleyin
2. Dosyaları web server'a yükleyin
3. Domain'i Google Console'larda authorize edin
4. HTTPS kullanmayı unutmayın (production için)

## 🚀 Local Development

### Server Management Scripts

Website'i yerel olarak çalıştırmak için hazır scriptler:

```bash
# Server'ı başlat
./start.sh

# Server'ı durdur
./stop.sh

# Server durumunu kontrol et
./status.sh

# Server'ı yeniden başlat
./restart.sh

# Canlı logları izle
tail -f logs/webapp.log
```

### Script Özellikleri

- ✅ **PID Tracking**: Process ID takibi
- ✅ **Log Management**: Otomatik log kayıtları
- ✅ **Status Monitoring**: Detaylı durum kontrolü
- ✅ **Graceful Shutdown**: Güvenli kapatma
- ✅ **Auto Cleanup**: Otomatik temizlik

### Server Bilgileri

- **Port**: 8000
- **URL**: http://localhost:8000
- **Logs**: `logs/webapp.log`
- **PID File**: `webapp.pid`

### Kullanıcı Hesapları

#### Test Kullanıcısı
- **Kullanıcı Adı**: `testuser`
- **Şifre**: `testuser`

#### Admin
- **Kullanıcı Adı**: `admin`
- **Şifre**: `admin`

## 📞 Destek

Teknik destek için: 8251108@gmail.com 