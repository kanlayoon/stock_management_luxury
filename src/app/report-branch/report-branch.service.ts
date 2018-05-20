import { Injectable } from '@angular/core';

import { ApiService } from '../services/api.service';
import { ProxyConfigService } from '../services/proxy.config.service';
import { Headers, Http, RequestOptions, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/toPromise';
import { ApiUrl } from '../services/apiUrl.service';

import * as FileSaver from 'file-saver';
import * as XLSX from 'xlsx';

const EXCEL_TYPE = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8';
const EXCEL_EXTENSION = '.xlsx';
var wopts = {showGridLines: false};

@Injectable()
export class ReportBranchService {
  private actionUrl: string;
  constructor(private _http: Http, private apiUrl: ApiUrl) {
    this.actionUrl = apiUrl.ApiServer;
  }
  public report_supply = (obj:any): Observable<any[]> =>  {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.post(this.actionUrl + "/report/supply/branch" , obj)
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
 }

 public report_req = (obj:any): Observable<any[]> =>  {
  let headers = new Headers({'Content-Type': 'application/json'});
  let options = new RequestOptions({ headers: headers });
  return this._http.post(this.actionUrl + "/report/req/branch" , obj)
  .map( (response: Response) => <any>response.json() )
  .do( x => console.log(x));
}
public report_reservation = (obj:any): Observable<any[]> =>  {
  let headers = new Headers({'Content-Type': 'application/json'});
  let options = new RequestOptions({ headers: headers });
  return this._http.post(this.actionUrl + "/report/reservation/branch" , obj)
  .map( (response: Response) => <any>response.json() )
  .do( x => console.log(x));
}
public report_use = (obj:any): Observable<any[]> =>  {
  let headers = new Headers({'Content-Type': 'application/json'});
  let options = new RequestOptions({ headers: headers });
  return this._http.post(this.actionUrl + "/report/use/branch" , obj)
  .map( (response: Response) => <any>response.json() )
  .do( x => console.log(x));
}
public exportAsExcelFile(json: any[], excelFileName: string): void {

  const worksheet: XLSX.WorkSheet = XLSX.utils.json_to_sheet(json);
  const workbook: XLSX.WorkBook = { Sheets: { 'data': worksheet }, SheetNames: ['data'] };
  const excelBuffer: any = XLSX.write(workbook, { bookType: 'xlsx', type: 'buffer', bookSST: false});
  this.saveAsExcelFile(excelBuffer, excelFileName);
}

private saveAsExcelFile(buffer: any, fileName: string): void {
  const data: Blob = new Blob([buffer], {
    type: EXCEL_TYPE
  });
  FileSaver.saveAs(data, fileName + '_export_' + new Date().getTime() + EXCEL_EXTENSION);
}
}
 