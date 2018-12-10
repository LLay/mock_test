defmodule MockerTest do
  use ExUnit.Case

  import Mock

  test "bar is mocked when called from another module" do
    with_mock Mocker, [:passthrough], [bar: fn() -> :mocked end] do
      assert Other.function() == :mocked
    end
  end

  test "bar is mocked when called from own module" do
    with_mock Mocker, [:passthrough], [bar: fn() -> :mocked end] do
      assert Mocker.foo() == :mocked
    end
  end
end
