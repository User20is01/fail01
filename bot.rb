require 'telegram/bot'

# استبدل التوكن الخاص بك هنا
token = '7393080286:AAEwXX-5Lx-_cQbKRHJWQZh5HeZoC9AJpXM'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "مرحبًا! أنا بوت الحاسبة. أرسل لي أي عملية رياضية وسأحسبها لك!")
    else
      begin
        # حساب العملية الرياضية
        result = eval(message.text)
        bot.api.send_message(chat_id: message.chat.id, text: " أيها السافل ههه النتيجة: #{result}")
      rescue StandardError
        bot.api.send_message(chat_id: message.chat.id, text: 'هناك خطأ في العملية! يرجى إدخال صيغة صحيحة.')
      end
    end
  end
end
