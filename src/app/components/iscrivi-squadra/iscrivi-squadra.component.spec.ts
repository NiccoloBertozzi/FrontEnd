import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IscriviSquadraComponent } from './iscrivi-squadra.component';

describe('IscriviSquadraComponent', () => {
  let component: IscriviSquadraComponent;
  let fixture: ComponentFixture<IscriviSquadraComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ IscriviSquadraComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(IscriviSquadraComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
