{
  users.fea.programs.qutebrowser =
    let
      startpageUrl = "https://www.startpage.com";
    in
    {
      enable = true;
      searchEngines.DEFAULT = "${startpageUrl}/sp/search?query={}";
      settings.url = {
        default_page = startpageUrl;
        start_pages = startpageUrl;
      };
    };
}
