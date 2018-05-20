import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from '@angular/router';


import { AppComponent }      from './app.component';
import { LoginComponent }      from './login/login.component';
import { HeaderComponent }      from './header/header.component';
import { DashboardHeadOfficeComponent }      from './dashboard-head-office/dashboard-head-office.component';
import { ProductComponent }      from './product/product.component';
import { AddProductComponent }      from './add-product/add-product.component';
import { UpdateProductComponent }      from './update-product/update-product.component';
import { SupplyComponent }      from './supply/supply.component';
import { RequisitionComponent }      from './requisition/requisition.component';
import { NotificationComponent }      from './notification/notification.component';
import { NotificationBranchComponent }      from './notification-branch/notification-branch.component';
import { ReportComponent }      from './report/report.component';
import { ReportBranchComponent }      from './report-branch/report-branch.component';
import { UsingproductComponent }      from './usingproduct/usingproduct.component';
import { DashboardBranchComponent }      from './dashboard-branch/dashboard-branch.component';
import { ProductBranchComponent }      from './product-branch/product-branch.component';
import { RequestComponent }      from './request/request.component';
import { ReservationComponent }      from './reservation/reservation.component';
import { UsingproductBranchComponent }      from './usingproduct-branch/usingproduct-branch.component';
import { ManageCourseProductComponent }      from './manage-course-product/manage-course-product.component';
import { HeaderBranchComponent }      from './header-branch/header-branch.component';
import { TypeProductComponent }      from './TypeProduct/TypeProduct.component';
import { manageProductComponent }      from './manageProduct/manageProduct.component';
import {ManageEmployeeComponent} from './manage-employee/Manage-employee.component';
//service
import { ModuleWithProviders } from '@angular/core';
import { AuthGuard  } from './login/_guards/auth.guard';

const routes: Routes = [
   { path: '', component: LoginComponent },
    { path: 'app', component: AppComponent },
    { path: 'login', component: LoginComponent },
    { path: 'header', component: HeaderComponent , canActivate:[AuthGuard] },
    { path: 'dashboard-head-office', component: DashboardHeadOfficeComponent, canActivate:[AuthGuard] },
    { path: 'product', component: ProductComponent,canActivate:[AuthGuard]},
    { path: 'add-product', component: AddProductComponent,canActivate:[AuthGuard]},
    { path: 'update-product', component: UpdateProductComponent,canActivate:[AuthGuard]},
    { path: 'supply', component: SupplyComponent,canActivate:[AuthGuard]},
    { path: 'requisition', component: RequisitionComponent,canActivate:[AuthGuard]},
    { path: 'notification', component: NotificationComponent,canActivate:[AuthGuard]},
    { path: 'notification-branch', component: NotificationBranchComponent,canActivate:[AuthGuard]},
    { path: 'report', component: ReportComponent,canActivate:[AuthGuard]},
    { path: 'report-branch', component: ReportBranchComponent,canActivate:[AuthGuard]},
    { path: 'using-product', component: UsingproductComponent,canActivate:[AuthGuard]},
    { path: 'dashboard-branch', component: DashboardBranchComponent,canActivate:[AuthGuard]},
    { path: 'product-branch', component: ProductBranchComponent,canActivate:[AuthGuard]},
    { path: 'request', component: RequestComponent,canActivate:[AuthGuard]},
    { path: 'reservation', component: ReservationComponent,canActivate:[AuthGuard]},
    { path: 'using-product-branch', component: UsingproductBranchComponent,canActivate:[AuthGuard]},
    { path: 'manage-courseProduct', component: ManageCourseProductComponent,canActivate:[AuthGuard]},
    { path: 'header-branch', component: HeaderBranchComponent,canActivate:[AuthGuard]},
    { path: 'update-product/:id', component: UpdateProductComponent ,canActivate:[AuthGuard]} ,
    { path: 'type-product', component: TypeProductComponent,canActivate:[AuthGuard]},
    { path: 'manage-product', component: manageProductComponent,canActivate:[AuthGuard]},
    { path: 'manage-employee', component: ManageEmployeeComponent,canActivate:[AuthGuard]},
     
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
export const routings: ModuleWithProviders = RouterModule.forRoot(routes);