from telethon import TelegramClient, events

# API kimlik bilgilerinizi buraya girin
api_id = '2271684'
api_hash = '4bc323bef24cc0e119eb7360e832d42'
phone_number = '+905303948093'

# Kaynak ve hedef kanalların ID'lerini buraya girin
kaynak_kanal_id = 2165954150  # Örneğin: -1001234567890
hedef_kanallar_idleri = [4139654383]  # Örneğin: -1009876543210, -1001122334455

client = TelegramClient('session_name', api_id, api_hash)

async def main():
    # Son gönderilen mesajın ID'sini saklamak için bir değişken
    son_mesaj_id = None

    while True:
        try:
            # Kaynak kanaldan en son gönderilen mesajı al
            mesajlar = await client.get_messages(kaynak_kanal_id, limit=1)
            if mesajlar:
                mesaj = mesajlar[0]
                
                # Yeni mesaj olup olmadığını kontrol et
                if son_mesaj_id is None or mesaj.id != son_mesaj_id:
                    son_mesaj_id = mesaj.id
                    # Mesajı hedef kanallara ilet
                    for hedef_kanal in hedef_kanallar_idleri:
                        try:
                            await client.send_message(hedef_kanal, mesaj)
                            print(f"Mesaj {hedef_kanal} kanalına iletildi.")
                        except Exception as e:
                            print(f"{hedef_kanal} kanalına mesaj gönderilirken hata oluştu: {e}")
            else:
                print("Kaynak kanaldan mesaj alınamadı.")
        except Exception as e:
            print(f"Mesaj alınırken hata oluştu: {e}")

        # 1 dakika bekle
        time.sleep(60)

with client:
    client.loop.run_until_complete(main())
