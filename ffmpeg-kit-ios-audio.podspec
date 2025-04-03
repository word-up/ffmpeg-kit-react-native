require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
    s.name         = "ffmpeg-kit-ios-audio"
    s.version      = "6.0"
    s.summary      = "FFmpegKit iOS Audio Binary"
    s.homepage     = "https://github.com/word-up/ffmpeg-kit-binaries"
    s.license      = { :type => "MIT" }
    s.authors      = package["author"]
  
    s.platform          = :ios, '12.1'
    s.requires_arc      = true
    s.static_framework  = true
  
    # Source for the audio binary zip
    s.source       = { 
      :http => 'https://github.com/word-up/ffmpeg-kit-binaries/raw/main/ios/6.0/ffmpeg-kit-ios-audio-6.0.zip',
      :type => 'zip'
    }
  
    # Frameworks included in the audio binary
    s.vendored_frameworks = 'ffmpegkit.xcframework',
                           'libavcodec.xcframework',
                           'libavdevice.xcframework',
                           'libavfilter.xcframework',
                           'libavformat.xcframework',
                           'libavutil.xcframework',
                           'libswresample.xcframework',
                           'libswscale.xcframework'
  
    # Preserve paths to ensure CocoaPods doesn't delete them
    s.preserve_paths = '*.xcframework'
  end
  