<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email')

          //  dropdown met de keuze van rollen.
            ->add('roles', ChoiceType::class, [
            'choices' => [
                'Patiënt' => 'ROLE_PATIENT',
                'Specialist' => 'ROLE_SPECIALIST',
                'Administrator' => 'ROLE_ADMIN',
            ],
            'expanded' => true, // dropdown, niet radioknoppen
            'multiple' => true, // slechts 1 rol mag gekozen worden
            'label' => 'Rol',
        ])

            ->add('password')
            ->add('first_name')
            ->add('last_name')
            ->add('adress')
            ->add('zip_code')
            ->add('city')
            ->add('specialization')
            ->add('submit', SubmitType::class);
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
