const HOURS_PER_DAY = 8;
const BILLABLE_DAYS_PER_MOUNTH = 22;

/**
 * The day rate, given a rate per hour
 *r
 * @param {number} ratePerHour
 * @returns {number} the rate per day
 */
export function dayRate(ratePerHour) {
  return ratePerHour * HOURS_PER_DAY;
}

/**
 * Calculates the rate per month
 *
 * @param {number} ratePerHour
 * @param {number} discount for example 20% written as 0.2
 * @returns {number} the rounded up monthly rate
 */
export function monthRate(ratePerHour, discount) {
  return Math.ceil(
    applyDiscount(dayRate(ratePerHour) * BILLABLE_DAYS_PER_MOUNTH, discount)
  );
}

/**
 * Calculates the number of days in a budget, rounded down
 *
 * @param {number} budget the total budget
 * @param {number} ratePerHour the rate per hour
 * @param {number} discount to apply, example 20% written as 0.2
 * @returns {number} the number of days
 */
export function daysInBudget(budget, ratePerHour, discount) {
  return Math.trunc(budget / applyDiscount(dayRate(ratePerHour), discount));
}

/**
 * Applies a discount to the value
 *
 * @param {number} value
 * @param {number} percentage for example 20% written as 0.2
 * @returns {number} the discounted value
 */
function applyDiscount(value, percentage) {
  return value - value * percentage;
}
