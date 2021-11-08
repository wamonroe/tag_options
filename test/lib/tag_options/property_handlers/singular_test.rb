# frozen_string_literal: true

require 'test_helper'

module TagOptions
  module PropertyHandler
    class ConfigurationTest < ActiveSupport::TestCase
      subject { TagOptions::Hash.new(id: '1') }

      context '.handler_for?' do
        should 'match the `id` property' do
          assert TagOptions::PropertyHandler::Singular.handler_for?('id')
        end

        should 'match the `role` property' do
          assert TagOptions::PropertyHandler::Singular.handler_for?('role')
        end

        should 'match various `aria` properties' do
          %w[aria-valuenow aria-valuemin aria-valuemax].each do |property|
            assert TagOptions::PropertyHandler::Singular.handler_for?(property)
          end
        end
      end

      context '#combine_with!' do
        should 'override an existing value' do
          subject.combine_with_id!('2')
          assert_equal '2', subject['id']
        end

        should 'override an existing value with the last specified value' do
          subject.combine_with_id!('2', '3')
          assert_equal '3', subject['id']
        end
      end

      context '#override!' do
        should 'override an existing value' do
          subject.override_id!('2')
          assert_equal '2', subject['id']
        end

        should 'override an existing value with the last specified value' do
          subject.override_id!('2', '3')
          assert_equal '3', subject['id']
        end
      end
    end
  end
end
