# frozen_string_literal: true

require_relative '../../lib/plugs'

class KeyPlugs
  include Plugs

  plug(:a) do
    plug(:b) do
      2
    end
    1
  end

  plug(:c) do
    3
  end
end

RSpec.describe 'Plug keys' do
  describe '.key?' do
    it 'has the keys of its plugs, nested or not' do
      expect(KeyPlugs.key?(:a)).to be(true)
      expect(KeyPlugs.key?(:b)).to be(true)
      expect(KeyPlugs.key?(:d)).to be(false)
    end
  end

  describe '#key?' do
    it 'has only the keys of the plugs sliced, and their children' do
      plugs = KeyPlugs[:a]

      expect(plugs.key?(:a)).to be(true)
      expect(plugs.key?(:b)).to be(true)
      expect(plugs.key?(:c)).to be(false)
    end
  end
end
