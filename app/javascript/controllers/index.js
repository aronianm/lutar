// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import NavController from "./nav_controller";
import trainorsController from './trainors_controller';
import workoutController from './workout_controller';
import exerciseController from './exercise_controller';
import searchController from './searchable_controller';

application.register("nav", NavController)
application.register('trainor', trainorsController)
application.register('exercise', exerciseController)
application.register('workout', workoutController)
application.register('searchable', searchController)

