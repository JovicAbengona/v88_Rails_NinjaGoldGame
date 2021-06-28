class RpgController < ApplicationController
  def index
    # reset_session
    if session[:gold] == nil
      session[:gold] = 0
      session[:activities] = [];
    end
    if session[:activities].length > 20
      session[:activities].slice!(0..10)
      # I needed to reduce the size of the array because if not, I will receive and error saying:
      # Set-cookie header is ignored ... Cookie length should be less than or equal to 4096 characters.
    end
  end 
  def farm
    earned_gold = rand(10..20)
    session[:gold] += earned_gold
    session[:activities].push({
      type: "earn",
      text: "Earned #{earned_gold} golds from the farm! (#{DateTime.now.strftime("%b %d, %Y %I:%M %p")})"
    })
    redirect_to '/'
  end

  def cave
    earned_gold = rand(5..10)
    session[:gold] += earned_gold
    session[:activities].push({
      type: "earn",
      text: "Earned #{earned_gold} golds from the cave! (#{DateTime.now.strftime("%b %d, %Y %I:%M %p")})"
    })
    redirect_to '/'
  end

  def house
    earned_gold = rand(2..5)
    session[:gold] += earned_gold
    session[:activities].push({
      type: "earn",
      text: "Earned #{earned_gold} golds from the house! (#{DateTime.now.strftime("%b %d, %Y %I:%M %p")})"
    })
    redirect_to '/'
  end

  def casino
    earn_or_take = rand(1..10)
    if earn_or_take%2 == 0
      session[:gold] += 50
      session[:activities].push({
        type: "earn",
        text: "Earned 50 golds from the house! (#{DateTime.now.strftime("%b %d, %Y %I:%M %p")})"
      })
    else
      session[:gold] -= 50
      session[:activities].push({
        type: "loss",
        text: "Entered a casino and lost 50 golds... OUCH! (#{DateTime.now.strftime("%b %d, %Y %I:%M %p")})"
      })
    end
    redirect_to '/'
  end
end
