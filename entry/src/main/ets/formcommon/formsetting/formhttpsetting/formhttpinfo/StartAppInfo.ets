import { FormHttpInfo } from '../../../utils/httputils/FormHttpInfo';
/**
 * FormHttpInfo.url is used to get the data for form update. You need to configure the url, it is necessary to
 * replace with the actual url. And http option is optional.
 *
 * # Examples
 *
 * ```
 * const startAppHttpInfo = new FormHttpInfo(
 *   'startApp1',
 *   new Map([['title', 'string'], ['image', 'Resource'], ['ratingNum', 'number']]),
 *   'url_to_be_replaced',
 *   {
 *     connectTimeout: 1000,
 *     readTimeout: 1000
 *   }
 * );
 * ```
 */

export const startAppHttpInfo = new FormHttpInfo(
  'startApp',
  new Map([
['backgroundImg', 'Resource'],
['textSubTitleY', 'string'],
['textMainTitleX', 'string'],]),
  'url_to_be_replaced'
);