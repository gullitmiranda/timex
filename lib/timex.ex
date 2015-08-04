defmodule Timex do
  defmacro __using__(_) do
    quote do
      alias Timex.DateTime
      alias Timex.Date
      alias Timex.Time
      alias Timex.TimezoneInfo
      alias Timex.Timezone
      alias Timex.DateFormat
      alias Timex.Date.Convert, as: DateConvert
      alias Timex.Format.Time.TimeFormatter, as: TimeFormat
    end
  end
  @moduledoc File.read!("README.md")
end

defimpl String.Chars, for: [ Timex.DateTime, Timex.Date, Timex.Time ] do
  def to_string(dt) do
    Timex.DateFormat.format!(dt)
  end
end

defimpl Inspect, for: [ Timex.DateTime, Timex.Date, Timex.Time ] do
  @inspected inspect(@for)

  def inspect(dt, _opts) do
    "#" <> @inspected <> "<" <> Timex.DateFormat.format!(dt) <> ">"
  end
end
