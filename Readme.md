
---

**Docker Ortamı Kurulumu**

### Bu Docker Ortamının Faydaları  
Eğer Linux'da çalışan biriyseniz işletim sisteminin her sıfırdan yüklenmesinden sonra paket kurulumlarından sıkıldıysanız veya işletim sisteminde kurulan paketler artık bellekte fazla yer kaplıyorsa, Docker ortamında çalışarak sistem dosyalarına müdahale etmeden çalışabilirsiniz. Vim'de derin öğrenme uygulamaları geliştirirken kullandığım kütüphaneler ve IDE ayarlarını kullanarak bir Docker ortamı oluşturdum. Bu ortamın özellikleri, kurulumun basit olması dolayısıyla kurulumdan sonra geliştirme ortamı hazır hale gelir.

### Linux için Ön Hazırlık  
Bilgisayarım NVIDIA ekran kartına sahip, bu yüzden Docker ortamında GPU'ları kullanabilmem için NVIDIA Container Toolkit aracının kurulumunu yapmam gerekiyor.

---



```bash 
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```

```bash
#Paketleri guncelle ve nvidia-container-toolkit indir
sudo apt update
sudo apt-get install -y nvidia-container-toolkit
```

```bash
#Kurulumdan sonra gpu destegi icin ayarla
sudo nvidia-ctk runtime configure --runtime=docker
```

```bash
#Bilgisayari yeniden baslat
reboot
```

### Docker Ortamının Kurulumu

```bash
git clone https://github.com/MuhammetOzturk/Linux-Ayarlarim.git
cd Linux-Ayarlarim
chmod +x docker-build.sh
chmod +x docker-start.sh
bash docker-build.sh
bash docker-start.sh

```
