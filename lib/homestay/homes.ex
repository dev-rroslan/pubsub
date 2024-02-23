defmodule Homestay.Homes do
  @moduledoc """
  The Homes context.
  """

  import Ecto.Query, warn: false
  alias Homestay.Repo

  alias Homestay.Homes.Homeowner

  @doc """
  Returns the list of homeowners.

  ## Examples

      iex> list_homeowners()
      [%Homeowner{}, ...]

  """
  def list_homeowners do
    Repo.all(Homeowner)
  end

  @doc """
  Gets a single homeowner.

  Raises `Ecto.NoResultsError` if the Homeowner does not exist.

  ## Examples

      iex> get_homeowner!(123)
      %Homeowner{}

      iex> get_homeowner!(456)
      ** (Ecto.NoResultsError)

  """
  def get_homeowner!(id), do: Repo.get!(Homeowner, id)

  @doc """
  Creates a homeowner.

  ## Examples

      iex> create_homeowner(%{field: value})
      {:ok, %Homeowner{}}

      iex> create_homeowner(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_homeowner(attrs \\ %{}) do
    %Homeowner{}
    |> Homeowner.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a homeowner.

  ## Examples

      iex> update_homeowner(homeowner, %{field: new_value})
      {:ok, %Homeowner{}}

      iex> update_homeowner(homeowner, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_homeowner(%Homeowner{} = homeowner, attrs) do
    homeowner
    |> Homeowner.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a homeowner.

  ## Examples

      iex> delete_homeowner(homeowner)
      {:ok, %Homeowner{}}

      iex> delete_homeowner(homeowner)
      {:error, %Ecto.Changeset{}}

  """
  def delete_homeowner(%Homeowner{} = homeowner) do
    Repo.delete(homeowner)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking homeowner changes.

  ## Examples

      iex> change_homeowner(homeowner)
      %Ecto.Changeset{data: %Homeowner{}}

  """
  def change_homeowner(%Homeowner{} = homeowner, attrs \\ %{}) do
    Homeowner.changeset(homeowner, attrs)
  end

  alias Homestay.Homes.Home

  @doc """
  Returns the list of homes.

  ## Examples

      iex> list_homes()
      [%Home{}, ...]

  """
  def list_homes do
    Repo.all(Home)
  end

  @doc """
  Gets a single home.

  Raises `Ecto.NoResultsError` if the Home does not exist.

  ## Examples

      iex> get_home!(123)
      %Home{}

      iex> get_home!(456)
      ** (Ecto.NoResultsError)

  """
  def get_home!(id), do: Repo.get!(Home, id)

  @doc """
  Creates a home.

  ## Examples

      iex> create_home(%{field: value})
      {:ok, %Home{}}

      iex> create_home(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_home(attrs \\ %{}) do
    %Home{}
    |> Home.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a home.

  ## Examples

      iex> update_home(home, %{field: new_value})
      {:ok, %Home{}}

      iex> update_home(home, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_home(%Home{} = home, attrs) do
    home
    |> Home.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a home.

  ## Examples

      iex> delete_home(home)
      {:ok, %Home{}}

      iex> delete_home(home)
      {:error, %Ecto.Changeset{}}

  """
  def delete_home(%Home{} = home) do
    Repo.delete(home)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking home changes.

  ## Examples

      iex> change_home(home)
      %Ecto.Changeset{data: %Home{}}

  """
  def change_home(%Home{} = home, attrs \\ %{}) do
    Home.changeset(home, attrs)
  end
end
