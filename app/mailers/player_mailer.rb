class PlayerMailer < ApplicationMailer
  def invite(player, tournament)
    @player = player
    @tournament= tournament
    @token = Knock::AuthToken.new(payload: { sub: player.id }).token
    mail(to: @player.email, subject: "Welcome to #{tournament.name}")
  end
end
