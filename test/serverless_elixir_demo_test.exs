defmodule ServerlessElixirDemoTest do
  use ExUnit.Case
  doctest ServerlessElixirDemo

  test "greets the world" do
    assert ServerlessElixirDemo.hello() == :world
  end
end
