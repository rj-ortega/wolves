RSpec.describe Wolves do
  it "has main game properties" do
    expect(Wolves::TITLE).not_to be nil
    expect(Wolves::WIDTH).not_to be nil
    expect(Wolves::HEIGHT).not_to be nil
    expect(Wolves::BACKGROUND).not_to be nil
  end
end
