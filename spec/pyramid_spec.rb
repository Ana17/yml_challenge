require 'rspec'
require 'pry'
require_relative '../pyramid.rb'

RSpec.describe 'Pyramid app' do

  let(:pyramid1) { [[1, 2, 3, 1], [3, 5, 4], [8, 9], [17] }
  let(:pyramid2) { [[4, 5, 2, 3, 1], [9, 7, 5, 4], [16, 12, 9], [28, 21], [49]] }
  let(:corner_case_pyramid) { [[1]] }

  context 'get_upper_level' do
    it 'should return upper level' do
      target_level = pyramid.first
      expected_upper_level = pyramid[1]
      actual_upper_level = Pyramid::get_upper_level(target_level)
      expect(actual_upper_level).to eq expected_upper_level
    end

    it 'should return an empty level for 1 element level' do
      target_level = [1]
      expected_upped_level = []
      actual_upper_level = Pyramid::get_upper_level(target_level)
      expect(actual_upper_level).to eq expected_upped_level
    end
  end

  context 'get_pyramid_itter' do
    it 'should build and return a pyramid' do
      base = pyramid.first
      expected_pyramid = pyramid
      actual_pyramid = Pyramid::get_pyramid_itter([base])
      expect(actual_pyramid).to eq expected_pyramid
    end

    it 'should work for 1 level pyramid' do
      expected_pyramid = corner_case_pyramid
      actual_pyramid = Pyramid::get_pyramid_itter(corner_case_pyramid)
      expect(actual_pyramid).to eq expected_pyramid
    end
  end

  context 'get_pyramid_req' do
    it 'should build and return a pyramid' do
      base = pyramid.first
      expected_pyramid = pyramid
      actual_pyramid = Pyramid::get_pyramid_req([base])
      expect(actual_pyramid).to eq expected_pyramid
    end

    it 'should work for 1 level pyramid' do
      expected_pyramid = corner_case_pyramid
      actual_pyramid = Pyramid::get_pyramid_req(corner_case_pyramid)
      expect(actual_pyramid).to eq expected_pyramid
    end
  end

  context 'get pyramid' do
    it 'should not allow empty base' do
      base = []
      expect{ Pyramid::get_pyramid(base) }.to raise_error(ArgumentError)
    end
  end
end
