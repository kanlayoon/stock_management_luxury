import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { manageProductComponent } from './manageProduct.component';

describe('SupplyComponent', () => {
  let component: manageProductComponent;
  let fixture: ComponentFixture<manageProductComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ manageProductComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(manageProductComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
