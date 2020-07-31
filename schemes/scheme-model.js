const db = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}

function find() {
    return db('schemes');
}

function findById(id) {
return db('schemes')
.where ({ id})
.first();
}

function findSteps(id) {
    return db('steps')
      .where("scheme_id", id)
  }

  function add(data) {
    return db('schemes')
      .insert(data)
      .then(ids => {
        return findById(ids[0])
    })
  }

  function addStep(data, id) {
    return db('steps')
      .insert(data)
      .where('scheme_id', id)
  }

function update(changes, id) {
return db("schemes")
.where({id})
.update(changes)
.then(count => {
    return findById(id);
})
}

function remove(id) {
    return db('schemes')
    .where({ id })
    .del();
    
}

