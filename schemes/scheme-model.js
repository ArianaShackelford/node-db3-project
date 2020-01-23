const db = require('../data/schemesdb-config.js');

module.exports = {
    find,
    findById, //expects id
    findSteps, //expects id
    add, // expects a param of a scheme object
    update, //expects a changes object and id
    remove //expects id

}

function find(){
    return db("schemes");
};

function findById(id){
    return db("schemes")
    .where({id})
    .first();
};

function findSteps(id){
    return db('steps as s')
        .join('schemes as sch', 'sch.id', 's.scheme_id' )
        .select('s.id', 's.step_number', 's.instructions')
        .where('sch.id', id)
        .orderBy('s.step_number')
};

function add(scheme){
    return db("schemes")
        .insert(scheme)
        .then(([id]) => {
            return findById(id);
        })
};

function update(changes, id){
    return db("schemes")
        .where({id})
        .update(changes)
};

function remove(id){
    return db("schemes")
        .where('id', id)
        .del();
};