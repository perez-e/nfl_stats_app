require 'spec_helper'

describe PlayersController do

  describe "POST create" do 

    it { should respond_to(:create) }

    context "given a specific string" do 

      it "of an active player, then redirect to show player page" do 
        post :create, {player: {name: "a.j. green" }}
        expect(response).to redirect_to("/players/2495450")
      end

      it "that is not a player, redirect to home path" do 
        post :create, {player: {name: "akjsnasjdn" }}
        expect(response).to redirect_to(root_path)
      end

    end

    context "player_info class method" do

      it "should return hash with players info" do 
        mock_model('Player')
        Player.should_receive(:player_info).and_return({:nfl_id=>"2495450", 
          :img_url=>"http://static.nfl.com/static/content/public/static/img/getty/headshot/G/R/E/GRE034604.jpg", 
          :name=>"A.J. Green", :college=>"Georgia", :height=>"6-4", :weight=>"207", 
          :position_id=>8, :number=>"#18"} )
        post :create, {player: {name: "a.j. green" }}
      end

    end

    context "player in the database" do 
      it "should be found with find_by_nfl_id" do 
        mock_model('Player')
        expect(Player).to receive(:find_by_nfl_id)

        post :create, {player: {name: "a.j. green" }}
      end
    end

  end


end