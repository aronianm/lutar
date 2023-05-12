import { Controller } from "@hotwired/stimulus"
import axios from 'axios';

export default class extends Controller {
  connect() {
    this.exercise = this.element.dataset.exercise || {'exercise_id': "", 'workout_sets': []}
    this.setNode = this.element.querySelector(".workoutSets")
    this.setCount = -1 
  }


  update(e2){
    var attr = e2.currentTarget.dataset.attributes
    this.exercise[attr] = e2.currentTarget.value
    debugger;
    console.log(this.exercise)
    var name = e2.currentTarget.text.trim()
    this.element.querySelector(".hs-dropdown-toggle").textContent = name 
  }

  
  addSet(){
    var set = {
        'duration': '0:00',
        'weight': 0,
        'metric': 'lb',
        'reps': 0
    }
    this.exercise.workout_sets.push(set)
    this.setCount += 1
    var setHtml = (
      `<div>
            <h3 class="flex items-center justify-center mb-5 font-extrabold dark:text-white">
              <span class="bg-blue-100 text-blue-800 font-semibold mr-2 px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ml-2">${this.setCount + 1}</span>
              </h3>
            ${this.durationInput()}
            ${this.weightInput()}
            ${this.repsInput()}
      </div>
      `
    )
  
 

    this.setNode.insertAdjacentHTML('beforeend', setHtml);

  }

  updateSet(evt){
    var index = evt.target.dataset.index
    this.exercise.workout_sets[index][evt.target.name] = evt.target.value

  }


  durationInput(i){
    return `<div class="form-control">
              <label class="input-group input-group-xs">
                <span class='bg-white w-20'>Duration</span>
                <input type="time" name='duration'  data-index=${this.setCount} class="input input-bordered input-xs bg-white w-20" data-action='focusout-> exercise#updateSet' />
              </label>
            </div>
    `
  }
  weightInput(i){
    return `<div class="form-control">
              <label class="input-group input-group-xs">
                <span class='bg-white w-20'>Weight</span>
                <input type='number' data-index=${this.setCount}  name='weight' class="input input-bordered input-xs bg-white w-20" data-action='input -> exercise#updateSet' />
              </label>
            </div>
    `
  }
  repsInput(i){
    return `<div class="form-control">
              <label class="input-group input-group-xs">
                <span class='bg-white w-20'>Reps</span>
                <input data-index=${this.setCount}  type="text" name='reps'  class="input input-bordered input-xs bg-white w-20" data-action='focusout -> exercise#updateSet' />
              </label>
            </div>
    `
  }


}
