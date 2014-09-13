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

	def write_row({ _, data}) do

	end


	def create_wavelet do
		load_image('images/lena2.png') |>
		Enum.map(&transform_row(&1))
	end
end
