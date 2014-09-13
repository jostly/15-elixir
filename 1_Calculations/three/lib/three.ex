defmodule Three do
	def load_image(file) do
		case :erl_img.load(file) do
			{:ok, img} -> 
				img |>
				elem(19) |>
				hd |>
				elem(8)
			_ -> []
		end
	end

	def transform_row({ row_number, pixels }) do 
		{ 
			row_number, 
			pixels |> :binary.bin_to_list |> Haar.transform
		}
	end

	def write_row(device, {row_number, data}) do
		IO.puts device, "#{Integer.to_string row_number}: #{format_data data}"
	end

	def format_data(data) do
		Enum.join(data, " ")
	end


	def create_wavelet do
		{:ok, out_file} = File.open("lena2.out", [:write])

		load_image('images/lena2.png') |>
		Enum.map(&transform_row(&1)) |>
		Enum.map(&write_row(out_file, &1))
	end

	def main do
		create_wavelet
	end
end

