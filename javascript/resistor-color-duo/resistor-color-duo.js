export const decodedValue = (inputs) => Number(inputs.map(col => COLORS.indexOf(col)).slice(0, 2).join(''));

const COLORS = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white',
];
