class AdvaFSP < Oxidized::Model

  prompt /\[\w+@\S+(\s+\S+)*\]\s?[#>]\s?$/
  comment "! "

  cmd 'show version' do |cfg|
    comment cfg
  end

  cmd 'show running-config'

  cfg :ssh do
    post_login do
      if vars(:enable) == true
        cmd "enable"

      end

    end

    post_login "no cli-paging"
    pre_logout "quit"

  end

end

