require 'spec_helper'

describe Bananas do
  it 'can list monkey patches.' do
    expect{ Bananas.monkey_patches }.not_to raise_error
  end
end
