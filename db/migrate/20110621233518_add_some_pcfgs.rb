class AddSomePcfgs < ActiveRecord::Migration
  def self.up
    [
      "paypal.login",
      "paypal.password",
      "paypal.signature",
      "challonge.api.username",
      "challonge.api.key"
    ].sort.each do |k|
      Pcfg.create(:key => k)
    end
  end

  def self.down
  end
end
