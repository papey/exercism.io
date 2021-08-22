export class GradeSchool {
  constructor() {
    this._db = {};
  }

  roster = () => {
    return this.copy(this._db);
  };

  add(name, grade) {
    this.removeDuplicates(name);
    this._db[grade] = this._db[grade] || [];
    this._db[grade].push(name);
    this._db[grade].sort();
  }

  removeDuplicates(name) {
    Object.entries(this._db).forEach(([grade, students]) => {
      if (students.includes(name))
        this._db[grade].splice(students.indexOf(name));
    });
  }

  grade(grade) {
    return this.copy(this._db[grade] || []);
  }

  copy = (data) => {
    return JSON.parse(JSON.stringify(data));
  };
}
