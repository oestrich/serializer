require 'spec_helper'

describe Nagare::Context do
  specify "creates methods for each attribute" do
    context = Nagare::Context.new({
      :user => "user",
    })

    expect(context.respond_to?(:user)).to be_truthy
    expect(context.user).to eq("user")
  end

  specify "accessible via keys" do
    context = Nagare::Context.new({
      "user" => "user",
    })

    expect(context["user"]).to eq("user")
  end

  specify "can extend the context for a new context" do
    context = Nagare::Context.new({
      :user => "user",
    })

    new_context = context.extend({
      :page => 1,
    })

    expect(context).to_not eq(new_context)

    expect(context.respond_to?(:page)).to be_falsy
    expect(new_context.respond_to?(:page)).to be_truthy
  end
end
