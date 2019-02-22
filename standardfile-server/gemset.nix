{
  actioncable = {
    dependencies = ["actionpack" "nio4r" "websocket-driver"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "005yvy8aqi7rbiy0a464yxna8sq3f60h9nd8d49ry7sq7jkzzpd7";
      type = "gem";
    };
    version = "5.0.1";
  };
  actionmailer = {
    dependencies = ["actionpack" "actionview" "activejob" "mail" "rails-dom-testing"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12dhi015qa9k3js45jzjmzxdl5bih4pg7s3vzlqb42wh0mkxlx98";
      type = "gem";
    };
    version = "5.0.1";
  };
  actionpack = {
    dependencies = ["actionview" "activesupport" "rack" "rack-test" "rails-dom-testing" "rails-html-sanitizer"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dfjskwpyspi3vxgjhd2v9aak7y8qa6jgrjp00kmjxnrna6kzrfd";
      type = "gem";
    };
    version = "5.0.1";
  };
  actionview = {
    dependencies = ["activesupport" "builder" "erubis" "rails-dom-testing" "rails-html-sanitizer"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13birq621m5q3q0yznl140vl5hkp60957kznjw2w5zb85via80p7";
      type = "gem";
    };
    version = "5.0.1";
  };
  activejob = {
    dependencies = ["activesupport" "globalid"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rpkfcv2k1sc0fxm1cn7g6zfsnlf5pivr4x4fxi5am42y8vm32xn";
      type = "gem";
    };
    version = "5.0.1";
  };
  activemodel = {
    dependencies = ["activesupport"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0l18w501fxhp0vp4lqn5ac4nzzm95l6m02cxbb68dwzmg6fnf5aw";
      type = "gem";
    };
    version = "5.0.1";
  };
  activerecord = {
    dependencies = ["activemodel" "activesupport" "arel"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "167fk6mpj9pggbr14436hix0jicf4qb9pbnisfhmhi10vvaxv3yl";
      type = "gem";
    };
    version = "5.0.1";
  };
  activesupport = {
    dependencies = ["concurrent-ruby" "i18n" "minitest" "tzinfo"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08bnl0nr9csjgkgz6xf8dyg7rccinmfrmn235z3bfaz8ihz15d1d";
      type = "gem";
    };
    version = "5.0.1";
  };
  airbrussh = {
    dependencies = ["sshkit"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yp1sl5n94ksxpwmaajflbdls45s81hw4spgz01h19xs2zrvv8wl";
      type = "gem";
    };
    version = "1.3.0";
  };
  arel = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0l757dkkaxk5fq3368l79jpyzq9a9driricjamhiwhwvh0h7xcyx";
      type = "gem";
    };
    version = "7.1.4";
  };
  bcrypt = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ysblqxkclmnhrd0kmb5mr8p38mbar633gdsb14b7dhkhgawgzfy";
      type = "gem";
    };
    version = "3.1.12";
  };
  builder = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qibi5s67lpdv1wgcj66wcymcr04q6j4mzws6a479n0mlrmh5wr1";
      type = "gem";
    };
    version = "3.2.3";
  };
  byebug = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kbfcn65rgdhi72n8x9l393b89rvi5z542459k7d1ggchpb0idb0";
      type = "gem";
    };
    version = "9.0.6";
  };
  capistrano = {
    dependencies = ["airbrussh" "capistrano-harrow" "i18n" "rake" "sshkit"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0v4fd69gai3mq0rykj3k8jy93dlhsdwjpaj3j0yd01jashg38lmh";
      type = "gem";
    };
    version = "3.6.1";
  };
  capistrano-bundler = {
    dependencies = ["capistrano" "sshkit"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jibawz92j07xaxhmzrvdlc7iah5kaig3dlypkci7cz1h6g9myny";
      type = "gem";
    };
    version = "1.2.0";
  };
  capistrano-git-submodule-strategy = {
    dependencies = ["capistrano"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "057pzdsw1y5jvrp49lmf0pnb1wmz7p32ml9ggwyjk8j1vy80as8l";
      type = "gem";
    };
    version = "0.1.23";
  };
  capistrano-harrow = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02i24xg2g0ypvawr87izsxdajp308gwlffjamnmx5fb6kxs6vmvl";
      type = "gem";
    };
    version = "0.5.3";
  };
  capistrano-passenger = {
    dependencies = ["capistrano"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0c0v3spmrdii4m9nwa0x9bn89wz9bnmxp0m88sggk629d5bh60fx";
      type = "gem";
    };
    version = "0.2.0";
  };
  capistrano-rails = {
    dependencies = ["capistrano" "capistrano-bundler"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "098c6w066idq5mdfmphd0wwlgi2gqrbr30sngzhj237ygzpcvdd5";
      type = "gem";
    };
    version = "1.3.0";
  };
  capistrano-rvm = {
    dependencies = ["capistrano" "sshkit"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15sy8zcal041yy5kb7fcdqnxvndgdhg3w1kvb5dk7hfjk3ypznsa";
      type = "gem";
    };
    version = "0.1.2";
  };
  capistrano-sidekiq = {
    dependencies = ["capistrano" "sidekiq"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "084r14zxx3ma6ykv6lnhhij4ni7yv6hkvpqr706smlmvkyyznpvl";
      type = "gem";
    };
    version = "0.10.0";
  };
  concurrent-ruby = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "183lszf5gx84kcpb779v6a2y0mx9sssy8dgppng1z9a505nj1qcf";
      type = "gem";
    };
    version = "1.0.5";
  };
  connection_pool = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17vpaj6kyf2i8bimaxz7rg1kyadf4d10642ja67qiqlhwgczl2w7";
      type = "gem";
    };
    version = "2.2.1";
  };
  crass = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1c377r8g7m58y22803iyjgqkkvnnii0pymskda1pardxrzaighj9";
      type = "gem";
    };
    version = "1.0.2";
  };
  diff-lcs = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18w22bjz424gzafv6nzv98h0aqkwz3d9xhm7cbr1wfbyas8zayza";
      type = "gem";
    };
    version = "1.3";
  };
  dotenv = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0la5dml189mibknk4y7dklkdhjajg96lvn7lcvm1v4yxgz4y1j4v";
      type = "gem";
    };
    version = "2.1.2";
  };
  dotenv-rails = {
    dependencies = ["dotenv" "railties"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "012wb1b8is27jp43rckh2w9bzdskjrkhndpjb5n4ja7w3aavq23k";
      type = "gem";
    };
    version = "2.1.2";
  };
  erubis = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fj827xqjs91yqsydf0zmfyw9p4l2jz5yikg3mppz6d7fi8kyrb3";
      type = "gem";
    };
    version = "2.7.0";
  };
  globalid = {
    dependencies = ["activesupport"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02smrgdi11kziqi9zhnsy9i6yr2fnxrqlv3lllsvdjki3cd4is38";
      type = "gem";
    };
    version = "0.4.1";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0h5wygnbpxas8kwhqkwk6n4s334dxyxvlxykc6mxfndb0m56166r";
      type = "gem";
    };
    version = "0.9.0";
  };
  jwt = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "124zz1142bi2if7hl5pcrcamwchv4icyr5kaal9m2q6wqbdl6aw4";
      type = "gem";
    };
    version = "1.5.6";
  };
  loofah = {
    dependencies = ["crass" "nokogiri"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0672aifc9rshw2fpfwca07pz8wizb707a1w1aaxmb6irnjhrbzac";
      type = "gem";
    };
    version = "2.1.1";
  };
  mail = {
    dependencies = ["mini_mime"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10dyifazss9mgdzdv08p47p344wmphp5pkh5i73s7c04ra8y6ahz";
      type = "gem";
    };
    version = "2.7.0";
  };
  method_source = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xqj21j3vfq4ldia6i2akhn2qd84m0iqcnsl49kfpq3xk6x0dzgn";
      type = "gem";
    };
    version = "0.9.0";
  };
  mini_mime = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kzf2zx1arhjhw9c6mns0jqbmzdkd1vw25v940lvw63fzkbfv6dg";
      type = "gem";
    };
    version = "0.1.4";
  };
  mini_portile2 = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13d32jjadpjj6d2wdhkfpsmy68zjx90p49bgf8f7nkpz86r1fr11";
      type = "gem";
    };
    version = "2.3.0";
  };
  minitest = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05521clw19lrksqgvg2kmm025pvdhdaniix52vmbychrn2jm7kz2";
      type = "gem";
    };
    version = "5.10.3";
  };
  mysql2 = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1v96khs3qcywizyv6fhp0xi8a15dmnbgsk6cy18m7nmxqrqj6152";
      type = "gem";
    };
    version = "0.4.8";
  };
  net-scp = {
    dependencies = ["net-ssh"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0b0jqrcsp4bbi4n4mzyf70cp2ysyp6x07j8k8cqgxnvb4i3a134j";
      type = "gem";
    };
    version = "1.2.1";
  };
  net-ssh = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "013p5jb4wy0cq7x7036piw2a3s1i9p752ki1srx2m289mpz4ml3q";
      type = "gem";
    };
    version = "4.1.0";
  };
  nio4r = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1adnm77xfxck0mrvid5d7lwng783gh580rh3y18nq4bwdikr6nha";
      type = "gem";
    };
    version = "1.2.1";
  };
  nokogiri = {
    dependencies = ["mini_portile2"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "105xh2zkr8nsyfaj2izaisarpnkrrl9000y3nyflg9cbzrfxv021";
      type = "gem";
    };
    version = "1.8.1";
  };
  puma = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1k13n500r7v480rcbxm7k09hip0zi7p8zvy3vajj8g9hb7gdcwnp";
      type = "gem";
    };
    version = "3.9.1";
  };
  rack = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kczgp2zwcrvp257dl8j4y3mnyqflxr7rn4vl9w1rwblznx9n74c";
      type = "gem";
    };
    version = "2.0.3";
  };
  rack-cors = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mkgiap9959pqgy93qz09w3dvvz8xx2cnz6wxmxr612v0ac63gmw";
      type = "gem";
    };
    version = "1.0.1";
  };
  rack-protection = {
    dependencies = ["rack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04dad1ij5lgjp2pk8ykpxxx2081krmlbh8gii5ip7zpwnc6g2x2m";
      type = "gem";
    };
    version = "2.0.0";
  };
  rack-test = {
    dependencies = ["rack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0h6x5jq24makgv2fq5qqgjlrk74dxfy62jif9blk43llw8ib2q7z";
      type = "gem";
    };
    version = "0.6.3";
  };
  rails = {
    dependencies = ["actioncable" "actionmailer" "actionpack" "actionview" "activejob" "activemodel" "activerecord" "activesupport" "railties" "sprockets-rails"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "079n7knpr10bsmbicmjyvifz2k3q6b5kf2i0zw8yv7lw90ncv6iz";
      type = "gem";
    };
    version = "5.0.1";
  };
  rails-dom-testing = {
    dependencies = ["activesupport" "nokogiri"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lfq2a7kp2x64dzzi5p4cjcbiv62vxh9lyqk2f0rqq3fkzrw8h5i";
      type = "gem";
    };
    version = "2.0.3";
  };
  rails-html-sanitizer = {
    dependencies = ["loofah"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "138fd86kv073zqfx0xifm646w6bgw2lr8snk16lknrrfrss8xnm7";
      type = "gem";
    };
    version = "1.0.3";
  };
  railties = {
    dependencies = ["actionpack" "activesupport" "method_source" "rake" "thor"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1mwyx6gkx0qdzcfkdx8s89x155qi82rk8r8z6scqr72v98iyn8v8";
      type = "gem";
    };
    version = "5.0.1";
  };
  rake = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08acfrq4chxcnd03l1zwjdb7ginmx461db49p9hb7czy4ni2lhbx";
      type = "gem";
    };
    version = "12.2.1";
  };
  redis = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kdj7511l6kqvqmaiw7kw604c83pk6f4b540gdsq1bf7yxm6qx6g";
      type = "gem";
    };
    version = "3.3.3";
  };
  responders = {
    dependencies = ["actionpack" "railties"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rhdyyvvm26f2l3fgwdp6xasfl2y0whwgy766bhdwz697mf78zfn";
      type = "gem";
    };
    version = "2.4.0";
  };
  rotp = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nb6555m1rm7shcili915imj6cr1gq9mpapqcl4qwjcmbkxqayf8";
      type = "gem";
    };
    version = "3.3.0";
  };
  rspec-core = {
    dependencies = ["rspec-support"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18np8wyw2g79waclpaacba6nd7x60ixg07ncya0j0qj1z9b37grd";
      type = "gem";
    };
    version = "3.6.0";
  };
  rspec-expectations = {
    dependencies = ["diff-lcs" "rspec-support"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "028ifzf9mqp3kxx40q1nbwj40g72g9zk0wr78l146phblkv96w0a";
      type = "gem";
    };
    version = "3.6.0";
  };
  rspec-mocks = {
    dependencies = ["diff-lcs" "rspec-support"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nv6jkxy24sag1i9w9wi3850k6skk2fm6yhcrgnmlz6vmwxvizp8";
      type = "gem";
    };
    version = "3.6.0";
  };
  rspec-rails = {
    dependencies = ["actionpack" "activesupport" "railties" "rspec-core" "rspec-expectations" "rspec-mocks" "rspec-support"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cvlmbn90k4rymlfb20ksayns5h199r9ggs67shnnanmrnh9zvyj";
      type = "gem";
    };
    version = "3.6.0";
  };
  rspec-support = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "050paqqpsml8w88nf4a15zbbj3vvm471zpv73sjfdnz7w21wnypb";
      type = "gem";
    };
    version = "3.6.0";
  };
  sidekiq = {
    dependencies = ["concurrent-ruby" "connection_pool" "rack-protection" "redis"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nazi3a9aq7c7cxk749qz9ilp7dv39r9n3zsbjg4frc96bb85s9w";
      type = "gem";
    };
    version = "5.0.4";
  };
  spring = {
    dependencies = ["activesupport"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "168yz9c1fv21wc5i8q7n43b9nk33ivg3ws1fn6x0afgryz3ssx75";
      type = "gem";
    };
    version = "2.0.2";
  };
  sprockets = {
    dependencies = ["concurrent-ruby" "rack"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0sv3zk5hwxyjvg7iy9sggjc7k3mfxxif7w8p260rharfyib939ar";
      type = "gem";
    };
    version = "3.7.1";
  };
  sprockets-rails = {
    dependencies = ["actionpack" "activesupport" "sprockets"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ab42pm8p5zxpv3sfraq45b9lj39cz9mrpdirm30vywzrwwkm5p1";
      type = "gem";
    };
    version = "3.2.1";
  };
  sshkit = {
    dependencies = ["net-scp" "net-ssh"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0h5jjzfr3cn0l064w40bh25jmbaqm8483pdazz0gdl05gccbcm15";
      type = "gem";
    };
    version = "1.14.0";
  };
  standard-file = {
    dependencies = ["bcrypt" "jwt" "rails"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p33cajmi2hdhjpgzi5mf2lf7km4wz6r1hcaxajlvhcgi6hdb63w";
      type = "gem";
    };
    version = "0.3.1";
  };
  thor = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nmqpyj642sk4g16nkbq6pj856adpv91lp4krwhqkh2iw63aszdl";
      type = "gem";
    };
    version = "0.20.0";
  };
  thread_safe = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nmhcgq6cgz44srylra07bmaw99f5271l0dpsvl5f75m44l0gmwy";
      type = "gem";
    };
    version = "0.3.6";
  };
  tzinfo = {
    dependencies = ["thread_safe"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "09dpbrih054mn42flbbcdpzk2727mzfvjrgqb12zdafhx7p9rrzp";
      type = "gem";
    };
    version = "1.2.4";
  };
  websocket-driver = {
    dependencies = ["websocket-extensions"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1943442yllhldh9dbp374x2q39cxa49xrm28nb78b7mfbv3y195l";
      type = "gem";
    };
    version = "0.6.5";
  };
  websocket-extensions = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07qnsafl6203a2zclxl20hy4jq11c471cgvd0bj5r9fx1qqw06br";
      type = "gem";
    };
    version = "0.1.2";
  };
}