import {getActorsForMovie, getDirectorForMovie, listDirectors, listActors, listMovies, getMovie} from './queries';
import {addMovie, addActor, deleteActor} from './mutations';


export default {
    Movie: {
        director: async ({id}) => {
            console.log(id)
            return await getDirectorForMovie(id)
        },
        actors: async ({id}, {total}) => {
            return await getActorsForMovie(id, total)
        }
    },
    Query: {
        listDirectors,
        listActors,
        listMovies,
        getMovie,
    },
    Mutation: {
        addMovie,
        addActor,
        deleteActor,
    }
}