defmodule ExFixturaTest do
  use ExUnit.Case
  doctest ExFixtura

  describe "fixtures/0" do
    test "returns list of fixtures" do
      assert ["posts", "users"] = ExFixtura.fixtures()
    end
  end

  describe "generated functions" do
    test "returns collection of structs" do
      assert %{"foo" => %{"last_name" => "bar", "name" => "foo"}} = ExFixtura.users()
    end
  end

  # test "greets the world" do
  #   assert ExFixtura.users() == [%User{name: "foo", last_name: "bar"}]
  # end
end
