require 'spec_helper'

describe Bowling do
  describe "#exclude_strikes" do    
    context "when scored some strikes" do
      let(:scores) { Hashie::Mash.new({scores: "1 2 10 3 4 10 10 10 10 10 10 10"}) }
      subject { Bowling.new(scores) }

      it "returns a list of scores excluding strikes" do
        expect(subject.exclude_strikes).to eq([1, 2, 3, 4])
      end
    end
  end

  describe "#frames" do
    context "when scored some strikes and spares" do
      let(:scores) { Hashie::Mash.new({scores: "1 2 10 3 4 10 9 1 10 10 10 10 10"}) }
      subject { Bowling.new(scores) }

      it "returns a list of scores excluding strikes" do
        expect(subject.frames).to eq([[1, 2], [3, 4], [9, 1]])
      end
    end
  end

  describe "#strikes" do
    context "when scored nothing" do
      subject { Bowling.new }

      it "returns zero score" do
        expect(subject.strikes).to eq(0)
      end
    end
    context "when scored some strikes" do
      let(:scores) { Hashie::Mash.new({scores: "1 2 10 3 4 10 10 10 10 10 10 10"}) }
      subject { Bowling.new(scores) }

      it "returns only strikes score" do
        expect(subject.strikes).to eq(240)
      end
    end
    context "when scored all strikes" do
      let(:scores) { Hashie::Mash.new({scores: "10 10 10 10 10 10 10 10 10 10"}) }
      subject { Bowling.new(scores) }

      it "returns perfect score" do
        expect(subject.strikes).to eq(300)
      end
    end
  end

  describe "#spares" do
    context "when scored nothing" do
      subject { Bowling.new }

      it "returns no spares" do
        expect(subject.spares).to eq(0)
      end
    end
    context "when scored some spares" do
      let(:scores) { Hashie::Mash.new({scores: "1 2 9 1 3 4 9 1 9 1 9 1 9 1 9 1 9 1 9 1"}) }
      subject { Bowling.new(scores) }

      it "returns only spares score" do
        expect(subject.spares).to eq(120)
      end
    end
  end

  describe "#scores" do
    context "when scored some strikes and spares" do
      let(:scores) { Hashie::Mash.new({scores: "1 2 10 9 1 10 10 3 4 10 10 10 10"}) }
      subject { Bowling.new(scores) }

      it "returns spares score" do
        expect(subject.scores).to eq(10)
      end
    end
  end

  describe "#calculate_scores" do
    context "when scored nothing" do
      subject { Bowling.new }

      it "returns zero score" do
        expect(subject.calculate_scores).to eq(0)
      end
    end
    context "when scored some strikes and spares" do
      let(:scores) { Hashie::Mash.new({scores: "1 2 10 9 1 10 10 3 4 10 10 10 10"}) }
      subject { Bowling.new(scores) }

      it "returns total scores including strikes and spares" do
        expect(subject.calculate_scores).to eq(235)
      end
    end
  end
end