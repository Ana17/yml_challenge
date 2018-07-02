require 'rspec'
require 'pry'
require_relative '../pyramid.rb'

RSpec.describe 'Pyramid app' do

  let(:pyramid_1) { [[1, 2, 3, 1], [3, 5, 4], [8, 9], [17]] }
  let(:pyramid_2) { [[4, 5, 2, 3, 1], [9, 7, 5, 4], [16, 12, 9], [28, 21], [49]] }
  let(:corner_case_pyramid) { [[1]] }

  context 'get_upper_level' do
    it ' - should return upper level' do
      target_level_1 = pyramid_1.first
      target_level_2 = pyramid_2.first

      expected_upper_level_1 = pyramid_1[1]
      expected_upper_level_2 = pyramid_2[1]

      actual_upper_level_1 = Pyramid::get_upper_level(target_level_1)
      actual_upper_level_2 = Pyramid::get_upper_level(target_level_2)

      expect(actual_upper_level_1).to eq expected_upper_level_1
      expect(actual_upper_level_2).to eq expected_upper_level_2
    end

    it ' - should return an empty level for 1 element base' do
      target_level = [1]
      expected_upper_level = []
      actual_upper_level = Pyramid::get_upper_level(target_level)
      expect(actual_upper_level).to eq expected_upper_level
    end
  end

  context 'get_pyramid_iter' do
    it ' - should build and return a pyramid' do
      base_1 = pyramid_1.first
      base_2 = pyramid_2.first

      expected_pyramid_1 = pyramid_1
      expected_pyramid_2 = pyramid_2

      actual_pyramid_1 = Pyramid::get_pyramid_iter([base_1])
      actual_pyramid_2 = Pyramid::get_pyramid_iter([base_2])

      expect(actual_pyramid_1).to eq expected_pyramid_1
      expect(actual_pyramid_2).to eq expected_pyramid_2
    end

    it ' - should work for 1 element pyramid using iteration' do
      expected_pyramid = corner_case_pyramid
      actual_pyramid = Pyramid::get_pyramid_iter(corner_case_pyramid)
      expect(actual_pyramid).to eq expected_pyramid
    end
  end

  context 'get_pyramid_rec' do
    it ' - should build and return a pyramid' do
      base_1 = pyramid_1.first
      base_2 = pyramid_2.first

      expected_pyramid_1 = pyramid_1
      expected_pyramid_2 = pyramid_2

      actual_pyramid_1 = Pyramid::get_pyramid_rec([base_1])
      actual_pyramid_2 = Pyramid::get_pyramid_rec([base_2])

      expect(actual_pyramid_1).to eq expected_pyramid_1
      expect(actual_pyramid_2).to eq expected_pyramid_2
    end

    it ' - should work for 1 element pyramid using recursion' do
      expected_pyramid = corner_case_pyramid
      actual_pyramid = Pyramid::get_pyramid_rec(corner_case_pyramid)
      expect(actual_pyramid).to eq expected_pyramid
    end
  end

  context 'get pyramid' do
    it ' - should not allow empty base' do
      base = []
      expect{ Pyramid::get_pyramid(base) }.to raise_error(ArgumentError)
    end
  end
end
