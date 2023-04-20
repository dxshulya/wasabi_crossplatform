class Api {
  static const baseURL = 'http://10.0.2.2:5000';

  static const getTasksQuery = '/tasks/createArrayTasks';
  static const getTotalCountQuery = '/favourites/getTotalCountFavourites';
  static const getFavouritesQuery = '/favourites/getAllFavourites';
  static const postLoginQuery = '/auth/login';
  static const postRegistrationQuery = '/auth/registration';
  static const postFavouriteQuery = '/favourites/addedFavourites';
  static const deleteFavouriteQuery = '/favourites/deleteFavourites';

  static const countParameter = 'count';
  static const pageParameter = 'page';
  static const idParameter = 'id';

  static const headerAuth = 'Authorization';
  static const headerBearer = 'Bearer';
}