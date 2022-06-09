class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :kitchen_sink ]

  def home
    @team_members = [
      {
        name: "Jose Garcia",
        image: "https://avatars.githubusercontent.com/u/102878262?v=4",
      },
      {
        name: "Nadia Isela",
        image: "nadia.jpg",
      },
      {
        name: "Joel Pickell",
        image: "https://ca.slack-edge.com/T02NE0241-U03BDRMC0GZ-78c09a789fc8-512",
      }
    ]
  end
end
