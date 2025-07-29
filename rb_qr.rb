require "rqrcode"

#Prompt user for the type of QR code they want to generate
puts "What type of QR code do you want to generate? Please select from the following:"
  puts "1. URL"
  puts "2. Wifi Login" 
  puts "3. Text Message" 
  puts "4. Exit Program"

qr_type = gets.chomp
qrcode = nil 

#Prompt user for relevant QR code details
if qr_type == "1"
    puts "Great, please provide the desired URL:"
    url = gets.chomp
    qrcode = RQRCode::QRCode.new(url)
elsif qr_type == "2"
   puts "Great, please provide the Wifi Network Name (SSID):"
   ssid = gets.chomp
   puts "Please provide the Network Password"
   password = gets.chomp
   wifi_string = "WIFI:T:WPA:S:#{ssid};P:#{password};;"
   qrcode = RQRCode::QRCode.new(wifi_string)
elsif qr_type == "3"
    puts "Please provide the phone number"
    phone = gets.chomp
    puts "Please provide the message:"
    message = gets.chomp
    sms_string = "SMSTO:#{phone}:#{message}"
    qrcode = RQRCode::QRCode.new(sms_string)
elsif qr_type == "4"
    puts "Exiting program."
    exit 
else 
    puts "Unrecognized response. Exiting"
    exit
end

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({:size => 500})

# Write the image data to a file
IO.binwrite("sometext.png", png.to_s)
puts "QR code generated and saved to 'sometext.png'."
