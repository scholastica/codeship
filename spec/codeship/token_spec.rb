RSpec.describe Codeship::Config do

  before do
    Codeship.configure { |c|
      c.verbose = true
      c.username = "test@example.com"
      c.password = "sekret"
    }
  end

  describe "#config" do
    subject { Codeship.config }
    it { expect(subject.verbose).to eq true }
    it { expect(subject.username).to eq "test@example.com" }
    it { expect(subject.password).to eq "sekret" }
  end

end
