#-*- coding: utf-8 -*-
Plugin.create :teokure do

  @@t = "tT" + "ｔＴ" + "ТтҬҭԎԏ" + "ȚțŤťT̈ẗṪŦƬȾ"
  @@e = "eE" + "ｅＥ" + "ЀЁЄЕЗезѐёєѮѯҘҙҨҩҼҽҾҿӖӗӘәӚӛӞӟԐԑЀЁ" + "∃Ǝ℮" + "ÈèÉéÊêËëĒēĖėĘęĚěƏə"
  @@o = "oO" + "ｏＯ" + "ОФофѲѳѺѻ҈҉ӦӧӨөӪӫ" + "∅ℚ" + "ÒòÓóÔôÕõÖöØøŐőƠơǪǫŌōǬǭƟɵº" + "〄"
  @@k = "kK" + "ｋＫ" + "ЌКкҚқҜҝҞҟҠҡӃӄԞԟ" + "ĶḰǨḲḴƘ₭"
  @@u = "uU" + "ｕＵ" + "ЏЦЧцчџѴѵѶѷҴҵҶҷҸҹӋӌӮӯӰӱӲӳӴӵ" + "∪" + "ÙùÚúÛûÜüŪūŬŭŮůŰűŲųƯưŨũÜü"
  @@r = "rR" + "ｒＲ" + "ЯяԄԅ" + "ℝℜ" + "ŘřŔŕṘŖȐɌȒṚṜṞ"
  @@te_ = "てテﾃ" + "〒"
  @@o_  = "おぉオｵォｫ" + ""
  @@ku_ = "くクｸ" + "<＜〈"
  @@re_ = "れレﾚ" + "Ԙԙ" + ""

  @@re = /((?:[#{@@t}]\s*[#{@@e}]|[#{@@te_}])\s*(?:[#{@@o}]|[#{@@o_}])\s*(?:[#{@@k}]\s*[#{@@u}]|[#{@@ku_}])\s*(?:[#{@@r}]\s*[#{@@e}]|[#{@@re_}]))/

  on_appear do |ms|
    ms.each do |m|
      if m.message.to_s =~ @@re and m.user != Service.primary.user
        m.favorite
      end
    end
  end

  command(:tweet_teokure,
          name: 'かっこよくておくれツイート',
          condition: lambda{ |opt| true },
          visible: true,
          role: :postbox) do |opt|
    begin
      teokure  = @@t.split('')[rand(@@t.size)]
      teokure += @@e.split('')[rand(@@e.size)]
      teokure += @@o.split('')[rand(@@o.size)]
      teokure += @@k.split('')[rand(@@k.size)]
      teokure += @@u.split('')[rand(@@u.size)]
      teokure += @@r.split('')[rand(@@r.size)]
      teokure += @@e.split('')[rand(@@e.size)]
      Service.primary.post :message => teokure
    rescue Exception => e
      Plugin.call(:update, nil, [Message.new(:message => "#{e.to_s}", :system => true)])
    end
  end

end

