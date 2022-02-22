import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddImpiantiComponent } from './add-impianti.component';

describe('AddImpiantiComponent', () => {
  let component: AddImpiantiComponent;
  let fixture: ComponentFixture<AddImpiantiComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddImpiantiComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddImpiantiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
