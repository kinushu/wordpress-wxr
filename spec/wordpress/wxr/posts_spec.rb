require 'spec_helper'

describe 'Wordpress Posts' do
  specify 'Can be initialized with post type' do
    expect(@wxr.posts('learning-objective').first).to_not be_nil
  end
end
