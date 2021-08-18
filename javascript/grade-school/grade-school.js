export class GradeSchool {
  constructor() {
    this._db = {};
    this._students = new Set();
  }

  roster = () => { return this.copy(this._db) }

  add = (name, grade) => {
    if (this._students.has(name)) {
      this.remove(name);
      this._students.delete(name);
      return;
    }

    this._students.add(name);
    this._db[grade] ? this._db[grade].push(name) : this._db[grade] = [name];
    this._db[grade].sort();
  }

  remove = (student) => {
    for (const [grade, name] of Object.entries(this._db)) {
      if (name == student) {
        this._db[grade] = this._db[grade].filter((value) => value != student);
        return;
      }
    }
  }

  copy = (data) => { return JSON.parse(JSON.stringify(data)) }

  grade = (grade) => { return this._db[grade] ? this.copy(this._db[grade].sort()) : [] }
}
