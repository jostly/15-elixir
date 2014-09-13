defmodule One do
	def main(args) do
		x = case args do
			["sum" | series] ->
				to_numbers(series) |>
				Enum.reduce(&+/2)
			["product" | series] ->
				to_numbers(series) |>
				Enum.reduce(&*/2)
			["mean" | series] ->
				n = Enum.count(series)
				sum = to_numbers(series) |>
				Enum.reduce(&+/2)

				sum / n
			["sqrt" | series] ->
				to_numbers(series) |>
				Enum.map(fn (x) -> 
					if x >= 0 do
						:math.sqrt(x)
					else
						s = :math.sqrt(-x)
						"#{s}i"
					end
				 end) |>
				Enum.join("\n")
			_ ->
				"Unknown operation"
		end
		IO.puts x
	end

	def to_numbers(series) do
		Enum.map(series, fn (x) -> {f, _} = Float.parse(x); f end)
	end

end
