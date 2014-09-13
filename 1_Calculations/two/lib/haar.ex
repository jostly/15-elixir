defmodule Haar do
	def transform(data) do
		step_transform(data, [], [])
	end

	def step_transform(data, accum_average, accum_difference) do
		{ averages, differences } = inner_transform(data, [], [])

		case averages do
			[x] -> averages ++ differences ++ accum_difference
			_ -> step_transform(averages, averages ++ accum_average, differences ++ accum_difference)
		end
	end

	def inner_transform(data, accum_average, accum_difference) do
		case data do
			[a, b | tail] -> 
				average = (a+b)/2
				difference = a - average
				inner_transform(tail, accum_average ++ [average], accum_difference ++ [difference])
			_ ->
				{accum_average, accum_difference}
		end
	end

	def pairs(t) do
		Enum.map 1..(t*2), &(&1 * 2)
	end
end
